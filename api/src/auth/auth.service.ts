import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { Account, LoginType } from './account.entity';
import { AccountRepository } from './account.repository';
import { CreateAccountDto } from './dto/create-account';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(Account)
    private readonly accountRepo: AccountRepository,
    private jwtService: JwtService,
  ) {}

  async googleLogin(req) {
    if (!req.user) {
      return false;
    }

    const u = req.user;
    const account = await this.accountRepo.findOne({
      where: { username: u.email },
    });

    if (account && account.type == LoginType.gg) {
      return { token: await this.generateToken(account) };
    } else {
      const newAcc = new Account();
      newAcc.username = u.email;
      newAcc.type = LoginType.gg;
      newAcc.ggAccessToken = u.accessToken;

      await this.accountRepo.save(newAcc);
      return { token: await this.generateToken(newAcc) };
    }
  }

  async register(accountDto: CreateAccountDto): Promise<CreateAccountDto> {
    const hashPassword = await this.hashPassword(accountDto.password);
    await this.accountRepo.save({ ...accountDto, password: hashPassword });
    return accountDto;
  }

  async authentication(username: string, password: string) {
    const account = await this.findOneByUsername(username);
    if (account) {
      if (await this.comparePassword(password, account.password)) {
        return account;
      }
    }
    throw new UnauthorizedException();
  }

  async generateToken(payload: Account) {
    return this.jwtService.sign({
      id: payload.id,
    });
  }

  async hashPassword(password: string): Promise<any> {
    return await bcrypt.hash(password, 12);
  }

  async comparePassword(
    password: string,
    hashPassword: string,
  ): Promise<boolean> {
    return await bcrypt.compare(password, hashPassword);
  }

  async findOneByUsername(username: string): Promise<Account> {
    return await this.accountRepo.findOne({ where: { username } });
  }

  async findOneById(id: number): Promise<Account> {
    return await this.accountRepo.findOne({
      where: { id },
      relations: ['cats'],
    });
  }

  async findAll() {
    return await this.accountRepo.find();
  }
}
