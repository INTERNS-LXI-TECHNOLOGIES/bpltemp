import { IFacilityType, NewFacilityType } from './facility-type.model';

export const sampleWithRequiredData: IFacilityType = {
  id: 15544,
  name: 'abaft ha duh',
};

export const sampleWithPartialData: IFacilityType = {
  id: 3918,
  name: 'known portray',
};

export const sampleWithFullData: IFacilityType = {
  id: 13380,
  name: 'leading violin',
};

export const sampleWithNewData: NewFacilityType = {
  name: 'handy for',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
