export interface IOrganization {
  id: number;
  externalId?: number | null;
  name?: string | null;
  description?: string | null;
  organizationType?: string | null;
  organizationGroup?: string | null;
  parentOrganization?: string | null;
}

export type NewOrganization = Omit<IOrganization, 'id'> & { id: null };
