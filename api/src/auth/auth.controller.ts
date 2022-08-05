import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Req,
  Res,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { CurrentAccount } from 'src/common/decorators/current-user';
import { Roles } from 'src/common/decorators/role';
import { EnumRole } from 'src/common/enums/role.enum';
import { JwtAuthGuard } from 'src/common/guard/jwt-auth.guard';
import { RolesGuard } from 'src/common/guard/role.guard';
import { Account } from './account.entity';
import { AuthService } from './auth.service';
import { CreateAccountDto } from './dto/create-account';
import { LoginAccountDto } from './dto/login-account';

@ApiTags('Auth')
@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  register(@Body() accountDto: CreateAccountDto) {
    return this.authService.register(accountDto);
  }

  @Get('google/login')
  @UseGuards(AuthGuard('google'))
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  googleAuthRegister() {}

  @Get('google/redirect')
  @UseGuards(AuthGuard('google'))
  async googleAuthRedirect(@Req() req, @Res() res) {
    const r = await this.authService.googleLogin(req);
    if (r) {
      return res.redirect(`${process.env.CLIENT_URL}/signin?token=${r.token}`);
    }
    return res.redirect(`${process.env.CLIENT_URL}/signin?fail=true`);
  }

  @Post('login')
  async login(@Body() loginAccountDto: LoginAccountDto) {
    return this.authService.generateToken(
      await this.authService.authentication(
        loginAccountDto.username,
        loginAccountDto.password,
      ),
    );
  }

  @Get('accounts')
  @Roles(EnumRole.ADMIN)
  @UseGuards(JwtAuthGuard, RolesGuard)
  @ApiBearerAuth()
  findAll() {
    return this.authService.findAll();
  }

  @Get('accounts/:id')
  findOne(@Param('id') id: string) {
    return this.authService.findOneById(+id);
  }

  @Get('me')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  getMyAccount(@CurrentAccount() account: Account) {
    return this.authService.findOneById(account.id);
  }
}
