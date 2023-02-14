import { Controller, Get, Query } from '@nestjs/common';
import { RoomService } from './room.service';
import { DateFilters } from './dto';

@Controller('room')
export class RoomController {
  constructor(private readonly roomService: RoomService) {}

  @Get('doubleRoomAvailability')
  getAvailabitity(@Query() dateFilter: DateFilters) {
    return this.roomService.availability(dateFilter);
  }
}
