import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { IParentOrganization, NewParentOrganization } from '../parent-organization.model';

export type PartialUpdateParentOrganization = Partial<IParentOrganization> & Pick<IParentOrganization, 'id'>;

export type EntityResponseType = HttpResponse<IParentOrganization>;
export type EntityArrayResponseType = HttpResponse<IParentOrganization[]>;

@Injectable({ providedIn: 'root' })
export class ParentOrganizationService {
  protected readonly http = inject(HttpClient);
  protected readonly applicationConfigService = inject(ApplicationConfigService);

  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/parent-organizations');

  create(parentOrganization: NewParentOrganization): Observable<EntityResponseType> {
    return this.http.post<IParentOrganization>(this.resourceUrl, parentOrganization, { observe: 'response' });
  }

  update(parentOrganization: IParentOrganization): Observable<EntityResponseType> {
    return this.http.put<IParentOrganization>(
      `${this.resourceUrl}/${this.getParentOrganizationIdentifier(parentOrganization)}`,
      parentOrganization,
      { observe: 'response' },
    );
  }

  partialUpdate(parentOrganization: PartialUpdateParentOrganization): Observable<EntityResponseType> {
    return this.http.patch<IParentOrganization>(
      `${this.resourceUrl}/${this.getParentOrganizationIdentifier(parentOrganization)}`,
      parentOrganization,
      { observe: 'response' },
    );
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http.get<IParentOrganization>(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http.get<IParentOrganization[]>(this.resourceUrl, { params: options, observe: 'response' });
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getParentOrganizationIdentifier(parentOrganization: Pick<IParentOrganization, 'id'>): number {
    return parentOrganization.id;
  }

  compareParentOrganization(o1: Pick<IParentOrganization, 'id'> | null, o2: Pick<IParentOrganization, 'id'> | null): boolean {
    return o1 && o2 ? this.getParentOrganizationIdentifier(o1) === this.getParentOrganizationIdentifier(o2) : o1 === o2;
  }

  addParentOrganizationToCollectionIfMissing<Type extends Pick<IParentOrganization, 'id'>>(
    parentOrganizationCollection: Type[],
    ...parentOrganizationsToCheck: (Type | null | undefined)[]
  ): Type[] {
    const parentOrganizations: Type[] = parentOrganizationsToCheck.filter(isPresent);
    if (parentOrganizations.length > 0) {
      const parentOrganizationCollectionIdentifiers = parentOrganizationCollection.map(parentOrganizationItem =>
        this.getParentOrganizationIdentifier(parentOrganizationItem),
      );
      const parentOrganizationsToAdd = parentOrganizations.filter(parentOrganizationItem => {
        const parentOrganizationIdentifier = this.getParentOrganizationIdentifier(parentOrganizationItem);
        if (parentOrganizationCollectionIdentifiers.includes(parentOrganizationIdentifier)) {
          return false;
        }
        parentOrganizationCollectionIdentifiers.push(parentOrganizationIdentifier);
        return true;
      });
      return [...parentOrganizationsToAdd, ...parentOrganizationCollection];
    }
    return parentOrganizationCollection;
  }
}
