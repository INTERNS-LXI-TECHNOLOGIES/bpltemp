export interface IParentOrganization {
  id: number;
  name?: string | null;
}

export type NewParentOrganization = Omit<IParentOrganization, 'id'> & { id: null };
