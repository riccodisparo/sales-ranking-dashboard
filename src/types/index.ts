export type Team = 'PAYROLL' | 'CREDIT_CARD';

export interface Seller {
  id: string;
  name: string;
  salesValue: number;
  salesTarget: number;
  team: Team;
  photoUrl: string;
  createdAt: string;
  updatedAt: string;
}

export interface User {
  id: string;
  email: string;
  role: 'ADMIN' | 'USER';
}

export interface ThemeConfig {
  primaryColor: string;
  secondaryColor: string;
  accentColor: string;
  logoUrl: string;
  companyName: string;
}