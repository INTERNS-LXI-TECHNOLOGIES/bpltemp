export interface IAgentType {
  id: number;
  name?: string | null;
  description?: string | null;
}

export type NewAgentType = Omit<IAgentType, 'id'> & { id: null };
