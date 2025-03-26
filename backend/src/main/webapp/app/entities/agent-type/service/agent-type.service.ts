import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { IAgentType, NewAgentType } from '../agent-type.model';

export type PartialUpdateAgentType = Partial<IAgentType> & Pick<IAgentType, 'id'>;

export type EntityResponseType = HttpResponse<IAgentType>;
export type EntityArrayResponseType = HttpResponse<IAgentType[]>;

@Injectable({ providedIn: 'root' })
export class AgentTypeService {
  protected readonly http = inject(HttpClient);
  protected readonly applicationConfigService = inject(ApplicationConfigService);

  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/agent-types');

  create(agentType: NewAgentType): Observable<EntityResponseType> {
    return this.http.post<IAgentType>(this.resourceUrl, agentType, { observe: 'response' });
  }

  update(agentType: IAgentType): Observable<EntityResponseType> {
    return this.http.put<IAgentType>(`${this.resourceUrl}/${this.getAgentTypeIdentifier(agentType)}`, agentType, { observe: 'response' });
  }

  partialUpdate(agentType: PartialUpdateAgentType): Observable<EntityResponseType> {
    return this.http.patch<IAgentType>(`${this.resourceUrl}/${this.getAgentTypeIdentifier(agentType)}`, agentType, { observe: 'response' });
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http.get<IAgentType>(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http.get<IAgentType[]>(this.resourceUrl, { params: options, observe: 'response' });
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getAgentTypeIdentifier(agentType: Pick<IAgentType, 'id'>): number {
    return agentType.id;
  }

  compareAgentType(o1: Pick<IAgentType, 'id'> | null, o2: Pick<IAgentType, 'id'> | null): boolean {
    return o1 && o2 ? this.getAgentTypeIdentifier(o1) === this.getAgentTypeIdentifier(o2) : o1 === o2;
  }

  addAgentTypeToCollectionIfMissing<Type extends Pick<IAgentType, 'id'>>(
    agentTypeCollection: Type[],
    ...agentTypesToCheck: (Type | null | undefined)[]
  ): Type[] {
    const agentTypes: Type[] = agentTypesToCheck.filter(isPresent);
    if (agentTypes.length > 0) {
      const agentTypeCollectionIdentifiers = agentTypeCollection.map(agentTypeItem => this.getAgentTypeIdentifier(agentTypeItem));
      const agentTypesToAdd = agentTypes.filter(agentTypeItem => {
        const agentTypeIdentifier = this.getAgentTypeIdentifier(agentTypeItem);
        if (agentTypeCollectionIdentifiers.includes(agentTypeIdentifier)) {
          return false;
        }
        agentTypeCollectionIdentifiers.push(agentTypeIdentifier);
        return true;
      });
      return [...agentTypesToAdd, ...agentTypeCollection];
    }
    return agentTypeCollection;
  }
}
