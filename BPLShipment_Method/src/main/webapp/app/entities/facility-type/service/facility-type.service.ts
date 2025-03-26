import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { IFacilityType, NewFacilityType } from '../facility-type.model';

export type PartialUpdateFacilityType = Partial<IFacilityType> & Pick<IFacilityType, 'id'>;

export type EntityResponseType = HttpResponse<IFacilityType>;
export type EntityArrayResponseType = HttpResponse<IFacilityType[]>;

@Injectable({ providedIn: 'root' })
export class FacilityTypeService {
  protected readonly http = inject(HttpClient);
  protected readonly applicationConfigService = inject(ApplicationConfigService);

  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/facility-types');

  create(facilityType: NewFacilityType): Observable<EntityResponseType> {
    return this.http.post<IFacilityType>(this.resourceUrl, facilityType, { observe: 'response' });
  }

  update(facilityType: IFacilityType): Observable<EntityResponseType> {
    return this.http.put<IFacilityType>(`${this.resourceUrl}/${this.getFacilityTypeIdentifier(facilityType)}`, facilityType, {
      observe: 'response',
    });
  }

  partialUpdate(facilityType: PartialUpdateFacilityType): Observable<EntityResponseType> {
    return this.http.patch<IFacilityType>(`${this.resourceUrl}/${this.getFacilityTypeIdentifier(facilityType)}`, facilityType, {
      observe: 'response',
    });
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http.get<IFacilityType>(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http.get<IFacilityType[]>(this.resourceUrl, { params: options, observe: 'response' });
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getFacilityTypeIdentifier(facilityType: Pick<IFacilityType, 'id'>): number {
    return facilityType.id;
  }

  compareFacilityType(o1: Pick<IFacilityType, 'id'> | null, o2: Pick<IFacilityType, 'id'> | null): boolean {
    return o1 && o2 ? this.getFacilityTypeIdentifier(o1) === this.getFacilityTypeIdentifier(o2) : o1 === o2;
  }

  addFacilityTypeToCollectionIfMissing<Type extends Pick<IFacilityType, 'id'>>(
    facilityTypeCollection: Type[],
    ...facilityTypesToCheck: (Type | null | undefined)[]
  ): Type[] {
    const facilityTypes: Type[] = facilityTypesToCheck.filter(isPresent);
    if (facilityTypes.length > 0) {
      const facilityTypeCollectionIdentifiers = facilityTypeCollection.map(facilityTypeItem =>
        this.getFacilityTypeIdentifier(facilityTypeItem),
      );
      const facilityTypesToAdd = facilityTypes.filter(facilityTypeItem => {
        const facilityTypeIdentifier = this.getFacilityTypeIdentifier(facilityTypeItem);
        if (facilityTypeCollectionIdentifiers.includes(facilityTypeIdentifier)) {
          return false;
        }
        facilityTypeCollectionIdentifiers.push(facilityTypeIdentifier);
        return true;
      });
      return [...facilityTypesToAdd, ...facilityTypeCollection];
    }
    return facilityTypeCollection;
  }
}
