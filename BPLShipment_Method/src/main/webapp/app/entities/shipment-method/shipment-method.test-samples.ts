import { IShipmentMethod, NewShipmentMethod } from './shipment-method.model';

export const sampleWithRequiredData: IShipmentMethod = {
  id: 15908,
  name: 'or spork',
};

export const sampleWithPartialData: IShipmentMethod = {
  id: 7486,
  name: 'sesame quirkily',
  description: 'whether',
};

export const sampleWithFullData: IShipmentMethod = {
  id: 18539,
  name: 'deck',
  description: 'thankfully madly',
};

export const sampleWithNewData: NewShipmentMethod = {
  name: 'when',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
