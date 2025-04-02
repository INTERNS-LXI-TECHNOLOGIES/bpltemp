import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { IParentorganization, NewParentorganization } from '../parentorganization.model';

export type PartialUpdateParentorganization = Partial<IParentorganization> & Pick<IParentorganization, 'id'>;

export type EntityResponseType = HttpResponse<IParentorganization>;
export type EntityArrayResponseType = HttpResponse<IParentorganization[]>;

@Injectable({ providedIn: 'root' })
export class ParentorganizationService {
  protected readonly http = inject(HttpClient);
  protected readonly applicationConfigService = inject(ApplicationConfigService);

  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/parentorganizations');

  create(parentorganization: NewParentorganization): Observable<EntityResponseType> {
    return this.http.post<IParentorganization>(this.resourceUrl, parentorganization, { observe: 'response' });
  }

  update(parentorganization: IParentorganization): Observable<EntityResponseType> {
    return this.http.put<IParentorganization>(
      `${this.resourceUrl}/${this.getParentorganizationIdentifier(parentorganization)}`,
      parentorganization,
      { observe: 'response' },
    );
  }

  partialUpdate(parentorganization: PartialUpdateParentorganization): Observable<EntityResponseType> {
    return this.http.patch<IParentorganization>(
      `${this.resourceUrl}/${this.getParentorganizationIdentifier(parentorganization)}`,
      parentorganization,
      { observe: 'response' },
    );
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http.get<IParentorganization>(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http.get<IParentorganization[]>(this.resourceUrl, { params: options, observe: 'response' });
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getParentorganizationIdentifier(parentorganization: Pick<IParentorganization, 'id'>): number {
    return parentorganization.id;
  }

  compareParentorganization(o1: Pick<IParentorganization, 'id'> | null, o2: Pick<IParentorganization, 'id'> | null): boolean {
    return o1 && o2 ? this.getParentorganizationIdentifier(o1) === this.getParentorganizationIdentifier(o2) : o1 === o2;
  }

  addParentorganizationToCollectionIfMissing<Type extends Pick<IParentorganization, 'id'>>(
    parentorganizationCollection: Type[],
    ...parentorganizationsToCheck: (Type | null | undefined)[]
  ): Type[] {
    const parentorganizations: Type[] = parentorganizationsToCheck.filter(isPresent);
    if (parentorganizations.length > 0) {
      const parentorganizationCollectionIdentifiers = parentorganizationCollection.map(parentorganizationItem =>
        this.getParentorganizationIdentifier(parentorganizationItem),
      );
      const parentorganizationsToAdd = parentorganizations.filter(parentorganizationItem => {
        const parentorganizationIdentifier = this.getParentorganizationIdentifier(parentorganizationItem);
        if (parentorganizationCollectionIdentifiers.includes(parentorganizationIdentifier)) {
          return false;
        }
        parentorganizationCollectionIdentifiers.push(parentorganizationIdentifier);
        return true;
      });
      return [...parentorganizationsToAdd, ...parentorganizationCollection];
    }
    return parentorganizationCollection;
  }
}
