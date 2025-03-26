import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { IShipmentMethod, NewShipmentMethod } from '../shipment-method.model';

export type PartialUpdateShipmentMethod = Partial<IShipmentMethod> & Pick<IShipmentMethod, 'id'>;

export type EntityResponseType = HttpResponse<IShipmentMethod>;
export type EntityArrayResponseType = HttpResponse<IShipmentMethod[]>;

@Injectable({ providedIn: 'root' })
export class ShipmentMethodService {
  protected readonly http = inject(HttpClient);
  protected readonly applicationConfigService = inject(ApplicationConfigService);

  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/shipment-methods');

  create(shipmentMethod: NewShipmentMethod): Observable<EntityResponseType> {
    return this.http.post<IShipmentMethod>(this.resourceUrl, shipmentMethod, { observe: 'response' });
  }

  update(shipmentMethod: IShipmentMethod): Observable<EntityResponseType> {
    return this.http.put<IShipmentMethod>(`${this.resourceUrl}/${this.getShipmentMethodIdentifier(shipmentMethod)}`, shipmentMethod, {
      observe: 'response',
    });
  }

  partialUpdate(shipmentMethod: PartialUpdateShipmentMethod): Observable<EntityResponseType> {
    return this.http.patch<IShipmentMethod>(`${this.resourceUrl}/${this.getShipmentMethodIdentifier(shipmentMethod)}`, shipmentMethod, {
      observe: 'response',
    });
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http.get<IShipmentMethod>(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http.get<IShipmentMethod[]>(this.resourceUrl, { params: options, observe: 'response' });
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getShipmentMethodIdentifier(shipmentMethod: Pick<IShipmentMethod, 'id'>): number {
    return shipmentMethod.id;
  }

  compareShipmentMethod(o1: Pick<IShipmentMethod, 'id'> | null, o2: Pick<IShipmentMethod, 'id'> | null): boolean {
    return o1 && o2 ? this.getShipmentMethodIdentifier(o1) === this.getShipmentMethodIdentifier(o2) : o1 === o2;
  }

  addShipmentMethodToCollectionIfMissing<Type extends Pick<IShipmentMethod, 'id'>>(
    shipmentMethodCollection: Type[],
    ...shipmentMethodsToCheck: (Type | null | undefined)[]
  ): Type[] {
    const shipmentMethods: Type[] = shipmentMethodsToCheck.filter(isPresent);
    if (shipmentMethods.length > 0) {
      const shipmentMethodCollectionIdentifiers = shipmentMethodCollection.map(shipmentMethodItem =>
        this.getShipmentMethodIdentifier(shipmentMethodItem),
      );
      const shipmentMethodsToAdd = shipmentMethods.filter(shipmentMethodItem => {
        const shipmentMethodIdentifier = this.getShipmentMethodIdentifier(shipmentMethodItem);
        if (shipmentMethodCollectionIdentifiers.includes(shipmentMethodIdentifier)) {
          return false;
        }
        shipmentMethodCollectionIdentifiers.push(shipmentMethodIdentifier);
        return true;
      });
      return [...shipmentMethodsToAdd, ...shipmentMethodCollection];
    }
    return shipmentMethodCollection;
  }
}
