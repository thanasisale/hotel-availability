import { IsISO8601, IsNotEmpty } from 'class-validator';

export class DateFilters {
  @IsNotEmpty()
  @IsISO8601()
  start_date: string;
  @IsNotEmpty()
  @IsISO8601()
  end_date: string;
}
