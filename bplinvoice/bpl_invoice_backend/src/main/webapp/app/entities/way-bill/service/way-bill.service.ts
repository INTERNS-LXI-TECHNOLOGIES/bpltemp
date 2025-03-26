import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable, map } from 'rxjs';

import dayjs from 'dayjs/esm';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { IWayBill, NewWayBill } from '../way-bill.model';

export type PartialUpdateWayBill = Partial<IWayBill> & Pick<IWayBill, 'id'>;

type RestOf<T extends IWayBill | NewWayBill> = Omit<T, 'estimatedReadyDate' | 'estimatedShipDate'> & {
  estimatedReadyDate?: string | null;
  estimatedShipDate?: string | null;
};

export type RestWayBill = RestOf<IWayBill>;

export type NewRestWayBill = RestOf<NewWayBill>;

export type PartialUpdateRestWayBill = RestOf<PartialUpdateWayBill>;

export type EntityResponseType = HttpResponse<IWayBill>;
export type EntityArrayResponseType = HttpResponse<IWayBill[]>;

@Injectable({ providedIn: 'root' })
export class WayBillService {
  protected readonly http = inject(HttpClient);
  protected readonly applicationConfigService = inject(ApplicationConfigService);

  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/way-bills');

  create(wayBill: NewWayBill): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(wayBill);
    return this.http
      .post<RestWayBill>(this.resourceUrl, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  update(wayBill: IWayBill): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(wayBill);
    return this.http
      .put<RestWayBill>(`${this.resourceUrl}/${this.getWayBillIdentifier(wayBill)}`, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  partialUpdate(wayBill: PartialUpdateWayBill): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(wayBill);
    return this.http
      .patch<RestWayBill>(`${this.resourceUrl}/${this.getWayBillIdentifier(wayBill)}`, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  find(id: number): Observable<EntityResponseType> {
    return this.http
      .get<RestWayBill>(`${this.resourceUrl}/${id}`, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http
      .get<RestWayBill[]>(this.resourceUrl, { params: options, observe: 'response' })
      .pipe(map(res => this.convertResponseArrayFromServer(res)));
  }

  delete(id: number): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getWayBillIdentifier(wayBill: Pick<IWayBill, 'id'>): number {
    return wayBill.id;
  }

  compareWayBill(o1: Pick<IWayBill, 'id'> | null, o2: Pick<IWayBill, 'id'> | null): boolean {
    return o1 && o2 ? this.getWayBillIdentifier(o1) === this.getWayBillIdentifier(o2) : o1 === o2;
  }

  addWayBillToCollectionIfMissing<Type extends Pick<IWayBill, 'id'>>(
    wayBillCollection: Type[],
    ...wayBillsToCheck: (Type | null | undefined)[]
  ): Type[] {
    const wayBills: Type[] = wayBillsToCheck.filter(isPresent);
    if (wayBills.length > 0) {
      const wayBillCollectionIdentifiers = wayBillCollection.map(wayBillItem => this.getWayBillIdentifier(wayBillItem));
      const wayBillsToAdd = wayBills.filter(wayBillItem => {
        const wayBillIdentifier = this.getWayBillIdentifier(wayBillItem);
        if (wayBillCollectionIdentifiers.includes(wayBillIdentifier)) {
          return false;
        }
        wayBillCollectionIdentifiers.push(wayBillIdentifier);
        return true;
      });
      return [...wayBillsToAdd, ...wayBillCollection];
    }
    return wayBillCollection;
  }

  protected convertDateFromClient<T extends IWayBill | NewWayBill | PartialUpdateWayBill>(wayBill: T): RestOf<T> {
    return {
      ...wayBill,
      estimatedReadyDate: wayBill.estimatedReadyDate?.toJSON() ?? null,
      estimatedShipDate: wayBill.estimatedShipDate?.toJSON() ?? null,
    };
  }

  protected convertDateFromServer(restWayBill: RestWayBill): IWayBill {
    return {
      ...restWayBill,
      estimatedReadyDate: restWayBill.estimatedReadyDate ? dayjs(restWayBill.estimatedReadyDate) : undefined,
      estimatedShipDate: restWayBill.estimatedShipDate ? dayjs(restWayBill.estimatedShipDate) : undefined,
    };
  }

  protected convertResponseFromServer(res: HttpResponse<RestWayBill>): HttpResponse<IWayBill> {
    return res.clone({
      body: res.body ? this.convertDateFromServer(res.body) : null,
    });
  }

  protected convertResponseArrayFromServer(res: HttpResponse<RestWayBill[]>): HttpResponse<IWayBill[]> {
    return res.clone({
      body: res.body ? res.body.map(item => this.convertDateFromServer(item)) : null,
    });
  }
}
