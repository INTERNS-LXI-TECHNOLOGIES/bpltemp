import { IOrganisation, NewOrganisation } from './organisation.model';

export const sampleWithRequiredData: IOrganisation = {
  id: 15652,
  name: 'finally next',
};

export const sampleWithPartialData: IOrganisation = {
  id: 16461,
  name: 'sans',
};

export const sampleWithFullData: IOrganisation = {
  id: 3664,
  name: 'bonfire',
};

export const sampleWithNewData: NewOrganisation = {
  name: 'humble',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
