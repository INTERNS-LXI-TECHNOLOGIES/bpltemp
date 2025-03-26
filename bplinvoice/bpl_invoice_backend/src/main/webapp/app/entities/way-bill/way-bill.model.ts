import dayjs from 'dayjs/esm';
import { ICurrencyType } from 'app/entities/currency-type/currency-type.model';

export interface IWayBill {
  id: number;
  boxLimit?: number | null;
  shipmentType?: string | null;
  opfac?: string | null;
  deliveryAgent?: string | null;
  estimatedReadyDate?: dayjs.Dayjs | null;
  currencyUom?: string | null;
  estimatedShipDate?: dayjs.Dayjs | null;
  status?: string | null;
  referenceNumber?: string | null;
  currencyType?: ICurrencyType | null;
}

export type NewWayBill = Omit<IWayBill, 'id'> & { id: null };
