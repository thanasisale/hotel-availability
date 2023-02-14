import { Prisma, PrismaClient, Room } from '@prisma/client';
const prisma = new PrismaClient();

function generateRandomInteger(min: number, max: number) {
  return Math.floor(min + Math.random() * (max - min + 1));
}

function randomDate(start: Date, end: Date): Date {
  return new Date(
    start.getTime() + Math.random() * (end.getTime() - start.getTime()),
  );
}

function addDays(date: Date, days: number): Date {
  let newDate = new Date(date);
  newDate.setDate(date.getDate() + days);
  return newDate;
}

function createDatesArray(DatesN: number) {
  let bookedDates: Date[][] = new Array();
  for (let j = 0; j < DatesN; j++) {
    let fDate = randomDate(new Date(2023, 0, 1), new Date(2024, 0, 1));

    if (j > 0) {
      if (fDate < bookedDates[j - 1][1]) {
        fDate = randomDate(new Date(2023, 0, 1), new Date(2024, 0, 1));
      }
    }

    let lDate = addDays(fDate, generateRandomInteger(1, 7));

    bookedDates.push([fDate, lDate]);
  }
  return bookedDates;
}

async function main() {
  const roomsN: number = 10;
  let rooms: Prisma.RoomCreateInput[] = new Array();

  for (let i = 0; i < roomsN; i++) {
    let bookingsNum = generateRandomInteger(0, 3);
    let bookedDates = createDatesArray(bookingsNum * 2);
    let bookedData = new Array();
    for (let j = 0; j < bookingsNum; j++) {
      bookedData.push({
        checkinDate: bookedDates[j][0],
        checkoutDate: bookedDates[j][1],
      });
    }

    let temp = {
      bedsNumber: generateRandomInteger(2, 3),
      bookings: {
        create: bookedData,
      },
    };
    rooms.push(temp);
  }

  await Promise.all(
    rooms.map(async (room) => {
      await prisma.room.create({
        data: room,
      });
    }),
  );
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
