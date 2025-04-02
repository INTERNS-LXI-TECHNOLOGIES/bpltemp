export interface IParentorganization {
  id: number;
  name?: string | null;
  description?: string | null;
}

export type NewParentorganization = Omit<IParentorganization, 'id'> & { id: null };
