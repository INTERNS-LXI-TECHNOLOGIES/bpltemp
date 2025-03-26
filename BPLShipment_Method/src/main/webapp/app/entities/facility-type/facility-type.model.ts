export interface IFacilityType {
  id: number;
  name?: string | null;
}

export type NewFacilityType = Omit<IFacilityType, 'id'> & { id: null };
