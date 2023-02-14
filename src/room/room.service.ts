import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { DateFilters } from './dto';

@Injectable()
export class RoomService {
  constructor(private prisma: PrismaService) {}

  async availability(query: DateFilters) {
    const { start_date, end_date } = query;

    const checkDays = this.getDates(new Date(start_date), new Date(end_date));

    const rooms = await this.prisma.room.findMany({
      include: {
        bookings: true,
      },
    });

    let perDayAvailibility: Array<any> = new Array();
    let generalAvailibility: boolean = true;

    checkDays.forEach((day) => {
      // Find the rooms which are booked during the requested timeframe
      const r = rooms.reduce((rResult, room) => {
        const f = room.bookings.filter((booking) => {
          return (
            new Date(booking.checkinDate.toDateString()) <=
              new Date(day.toDateString()) &&
            new Date(day.toDateString()) <
              new Date(booking.checkoutDate.toDateString())
          );
        });

        if (f.length > 0) {
          rResult.push(room);
        }
        return rResult;
      }, []);

      // count the triple rooms not booked at the provided day
      const tripleRooms = rooms.filter(
        (room) => room.bedsNumber == 3 && !r.includes(room),
      ).length;

      // count the double rooms not booked at the provided day
      const doubleRooms = rooms.filter(
        (room) => room.bedsNumber == 2 && !r.includes(room),
      ).length;

      let text = `For ${day.toDateString()} there are ${tripleRooms} triple rooms and ${doubleRooms} double rooms available.`;
      const resultObj = {
        DayAvailibility: text,
        TripleRoomAvailability: tripleRooms > 0,
        DoubleRoomAvailibility: doubleRooms > 0,
      };
      perDayAvailibility.push(resultObj);

      // if there is no triple or double room available for a day in the timeframe set general availability to false
      if (!(tripleRooms > 0 && doubleRooms > 0)) {
        generalAvailibility = false;
      }
    });

    return { perDayAvailibility, generalAvailibility };
  }

  private addDays(currentDate: string | number | Date): Date {
    let date = new Date(currentDate);
    date.setDate(date.getDate() + 1);
    return date;
  }

  private getDates(startDate: Date, endDate: Date): Array<Date> {
    let currentDate: Date = startDate;
    let dates: Array<Date> = new Array();
    while (currentDate <= endDate) {
      dates.push(currentDate);
      currentDate = this.addDays(currentDate);
    }

    return dates;
  }
}
