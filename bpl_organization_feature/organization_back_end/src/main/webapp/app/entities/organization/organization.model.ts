import { IParentOrganization } from 'app/entities/parent-organization/parent-organization.model';

export interface IOrganization {
  id: number;
  externalId?: string | null;
  name?: string | null;
  description?: string | null;
  organizationType?: string | null;
  organizationGroup?: string | null;
  parentOrganization?: IParentOrganization | null;
}

export type NewOrganization = Omit<IOrganization, 'id'> & { id: null };
