import { IOrganization, NewOrganization } from './organization.model';

export const sampleWithRequiredData: IOrganization = {
  id: 20534,
  name: 'flawed mockingly',
};

export const sampleWithPartialData: IOrganization = {
  id: 4752,
  name: 'afore yippee toothpick',
  organizationType: 'pointed',
  organizationGroup: 'above physical though',
};

export const sampleWithFullData: IOrganization = {
  id: 12562,
  externalId: 'coarse',
  name: 'bonnet minus hm',
  description: 'incidentally fooey once',
  organizationType: 'tentacle',
  organizationGroup: 'upon only',
};

export const sampleWithNewData: NewOrganization = {
  name: 'negative coolly and',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
