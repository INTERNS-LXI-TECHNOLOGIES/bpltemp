import { ICurrencyType, NewCurrencyType } from './currency-type.model';

export const sampleWithRequiredData: ICurrencyType = {
  id: 23345,
};

export const sampleWithPartialData: ICurrencyType = {
  id: 13999,
  name: 'thoroughly meanwhile browse',
};

export const sampleWithFullData: ICurrencyType = {
  id: 30660,
  name: 'since aha',
};

export const sampleWithNewData: NewCurrencyType = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
