import { ICompany, NewCompany } from './company.model';

export const sampleWithRequiredData: ICompany = {
  id: 6800,
  name: 'reschedule ah',
};

export const sampleWithPartialData: ICompany = {
  id: 23013,
  name: 'fooey',
  location: 'once',
};

export const sampleWithFullData: ICompany = {
  id: 14111,
  name: 'clean',
  location: 'considering',
};

export const sampleWithNewData: NewCompany = {
  name: 'forenenst haze',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
