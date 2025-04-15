import { ICompany } from 'app/entities/company/company.model';

export interface IEmployee {
  id: number;
  name?: string | null;
  position?: string | null;
  email?: string | null;
  company?: Pick<ICompany, 'id'> | null;
}

export type NewEmployee = Omit<IEmployee, 'id'> & { id: null };
