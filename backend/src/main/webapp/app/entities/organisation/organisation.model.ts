import { IAgentType } from 'app/entities/agent-type/agent-type.model';

export interface IOrganisation {
  id: number;
  name?: string | null;
  agentType?: Pick<IAgentType, 'id'> | null;
}

export type NewOrganisation = Omit<IOrganisation, 'id'> & { id: null };
