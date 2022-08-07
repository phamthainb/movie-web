import { BadRequestException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';
import { EnumRole } from 'src/common/enums/role.enum';
import { Account, LoginType } from './account.entity';
import { AccountRepository } from './account.repository';
import { CreateAccountDto } from './dto/create-account';
import { LoginAccountDto, SearchAccountDto } from './dto/login-account';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(Account)
    private readonly accountRepo: AccountRepository,
    private jwtService: JwtService,
  ) {}

  async login(loginAccountDto: LoginAccountDto) {
    const u = await this.accountRepo.findOne({
      where: { username: loginAccountDto.username, type: LoginType.normal },
    });

    if (!u) {
      throw new BadRequestException('User not found or try other method');
    }

    return this.generateToken(
      await this.authentication(
        loginAccountDto.username,
        loginAccountDto.password,
      ),
    );
  }

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
    const u = await this.accountRepo.findOne({
      where: { username: accountDto.username },
    });
    if (u) {
      throw new BadRequestException('User has exist');
    }

    const hashPassword = await this.hashPassword(accountDto.password);
    await this.accountRepo.save({
      ...accountDto,
      password: hashPassword,
      role: EnumRole.USER,
    });
    return accountDto;
  }

  async authentication(username: string, password: string) {
    const account = await this.findOneByUsername(username);
    if (account) {
      if (await this.comparePassword(password, account.password)) {
        return account;
      }
    }
    throw new BadRequestException('Info not correct');
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
    return await this.accountRepo.findOne({
      where: { username },
      select: ['username', 'createdAt', 'id', 'role', 'type', 'password'],
    });
  }

  async findOneById(id: number): Promise<Account> {
    return await this.accountRepo.findOne({
      where: { id },
    });
  }

  async findAll(body: SearchAccountDto) {
    const u = this.accountRepo
      .createQueryBuilder('a')
      .andWhere('a.role != :ad', { ad: 'ADMIN' });

    if (body?.username) {
      u.andWhere('LOWER(a.username) like :us', { us: `%${body.username}%` });
    }

    return await u.getMany();
  }
}
