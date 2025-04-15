import { ICompany, NewCompany } from './company.model';

export const sampleWithRequiredData: ICompany = {
  id: 6800,
};

export const sampleWithPartialData: ICompany = {
  id: 9566,
  name: 'phooey once bah',
};

export const sampleWithFullData: ICompany = {
  id: 14111,
  name: 'clean',
  location: 'considering',
};

export const sampleWithNewData: NewCompany = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
