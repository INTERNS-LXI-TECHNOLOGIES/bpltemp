import { IEmployee, NewEmployee } from './employee.model';

export const sampleWithRequiredData: IEmployee = {
  id: 8899,
  name: 'blushing institute',
  position: 'requirement catalyst glossy',
  email: 'u=(*H@k)Odx.ThU*ZZ',
};

export const sampleWithPartialData: IEmployee = {
  id: 15019,
  name: 'jell',
  position: 'bracelet gratefully make',
  email: 'Jm&"@gz.;o',
};

export const sampleWithFullData: IEmployee = {
  id: 19019,
  name: 'sharply questionably softly',
  position: 'yak near',
  email: 'f5@/M1P|._?+.`',
};

export const sampleWithNewData: NewEmployee = {
  name: 'unless',
  position: 'annually whenever boo',
  email: 's9}@H.hp',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
