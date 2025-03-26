import dayjs from 'dayjs/esm';

import { IWayBill, NewWayBill } from './way-bill.model';

export const sampleWithRequiredData: IWayBill = {
  id: 1866,
};

export const sampleWithPartialData: IWayBill = {
  id: 28471,
  estimatedShipDate: dayjs('2025-03-25T22:09'),
  referenceNumber: 'burgeon',
};

export const sampleWithFullData: IWayBill = {
  id: 26611,
  boxLimit: 8908,
  shipmentType: 'exonerate during',
  opfac: 'yowza agile separately',
  deliveryAgent: 'by',
  estimatedReadyDate: dayjs('2025-03-25T12:11'),
  currencyUom: 'wealthy',
  estimatedShipDate: dayjs('2025-03-25T17:47'),
  status: 'exalt moralise pushy',
  referenceNumber: 'majestically whoa even',
};

export const sampleWithNewData: NewWayBill = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
