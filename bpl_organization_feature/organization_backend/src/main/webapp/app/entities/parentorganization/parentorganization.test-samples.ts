import { IParentorganization, NewParentorganization } from './parentorganization.model';

export const sampleWithRequiredData: IParentorganization = {
  id: 5964,
};

export const sampleWithPartialData: IParentorganization = {
  id: 3291,
  name: 'violently dial',
};

export const sampleWithFullData: IParentorganization = {
  id: 2454,
  name: 'deflate upon',
  description: 'beneath arcade operating',
};

export const sampleWithNewData: NewParentorganization = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
