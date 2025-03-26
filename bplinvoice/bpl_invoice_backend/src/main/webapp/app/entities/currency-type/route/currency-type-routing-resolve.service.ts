import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { ICurrencyType } from '../currency-type.model';
import { CurrencyTypeService } from '../service/currency-type.service';

const currencyTypeResolve = (route: ActivatedRouteSnapshot): Observable<null | ICurrencyType> => {
  const id = route.params.id;
  if (id) {
    return inject(CurrencyTypeService)
      .find(id)
      .pipe(
        mergeMap((currencyType: HttpResponse<ICurrencyType>) => {
          if (currencyType.body) {
            return of(currencyType.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default currencyTypeResolve;
