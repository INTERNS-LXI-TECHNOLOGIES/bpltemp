import { IEmployee, NewEmployee } from './employee.model';

export const sampleWithRequiredData: IEmployee = {
  id: 8899,
  name: 'blushing institute',
  position: 'requirement catalyst glossy',
  email: "u<')G@j(Ndx\\ogT)Y",
};

export const sampleWithPartialData: IEmployee = {
  id: 15019,
  name: 'jell',
  position: 'bracelet gratefully make',
  email: 'Il%!@fz\\;ny',
};

export const sampleWithFullData: IEmployee = {
  id: 19019,
  name: 'sharply questionably softly',
  position: 'yak near',
  email: 'e4@.L/N|\\c>*-_',
};

export const sampleWithNewData: NewEmployee = {
  name: 'unless',
  position: 'annually whenever boo',
  email: 't7}@G\\1p,O"L',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
