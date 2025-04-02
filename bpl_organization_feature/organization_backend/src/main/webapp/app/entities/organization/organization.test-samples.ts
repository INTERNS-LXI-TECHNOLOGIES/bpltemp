import { IOrganization, NewOrganization } from './organization.model';

export const sampleWithRequiredData: IOrganization = {
  id: 20534,
};

export const sampleWithPartialData: IOrganization = {
  id: 1375,
  description: 'plumber',
};

export const sampleWithFullData: IOrganization = {
  id: 12562,
  externalId: 'coarse',
  name: 'bonnet minus hm',
  description: 'incidentally fooey once',
};

export const sampleWithNewData: NewOrganization = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
