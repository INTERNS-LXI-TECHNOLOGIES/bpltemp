import { IAgentType, NewAgentType } from './agent-type.model';

export const sampleWithRequiredData: IAgentType = {
  id: 23549,
  name: 'why',
};

export const sampleWithPartialData: IAgentType = {
  id: 5691,
  name: 'geez underplay',
  description: 'shabby as',
};

export const sampleWithFullData: IAgentType = {
  id: 7893,
  name: 'gently',
  description: 'yahoo rigidly',
};

export const sampleWithNewData: NewAgentType = {
  name: 'ashamed if',
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
