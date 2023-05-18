import { ApiProperty } from '@nestjs/swagger';
import { IsBoolean } from 'class-validator';

export class CreateStatementDto {
    @IsBoolean()
    @ApiProperty({ required: true })
    published?: boolean = false;
}