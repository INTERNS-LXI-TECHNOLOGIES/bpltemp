import { IParentOrganization, NewParentOrganization } from './parent-organization.model';

export const sampleWithRequiredData: IParentOrganization = {
  id: 5964,
  name: 'cutover so noisily',
};

export const sampleWithPartialData: IParentOrganization = {
  id: 11723,
  name: 'oof cutover vice',
};

export const sampleWithFullData: IParentOrganization = {
  id: 2454,
  name: 'deflate upon',
};

export const sampleWithNewData: NewParentOrganization = {
  name: 'yawn boo instead',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
