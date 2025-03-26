import { IFacilityType } from 'app/entities/facility-type/facility-type.model';

export interface IShipmentMethod {
  id: number;
  name?: string | null;
  description?: string | null;
  parentType?: Pick<IFacilityType, 'id' | 'name'> | null;
}

export type NewShipmentMethod = Omit<IShipmentMethod, 'id'> & { id: null };
