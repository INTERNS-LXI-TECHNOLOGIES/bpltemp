import { IOrganization, NewOrganization } from './organization.model';

export const sampleWithRequiredData: IOrganization = {
  id: 20534,
};

export const sampleWithPartialData: IOrganization = {
  id: 1150,
  description: 'volunteer',
  organizationType: 'as if minor',
  organizationGroup: 'upright',
};

export const sampleWithFullData: IOrganization = {
  id: 12562,
  externalId: 761,
  name: 'within bonnet minus',
  description: 'than',
  organizationType: 'by why yuck',
  organizationGroup: 'independence upon',
  parentOrganization: 'astride offensively',
};

export const sampleWithNewData: NewOrganization = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
