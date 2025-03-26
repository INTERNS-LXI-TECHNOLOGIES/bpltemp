export interface ICurrencyType {
  id: number;
  name?: string | null;
}

export type NewCurrencyType = Omit<ICurrencyType, 'id'> & { id: null };
