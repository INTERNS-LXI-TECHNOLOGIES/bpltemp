import { inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRouteSnapshot, Router } from '@angular/router';
import { EMPTY, Observable, of } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { IParentOrganization } from '../parent-organization.model';
import { ParentOrganizationService } from '../service/parent-organization.service';

const parentOrganizationResolve = (route: ActivatedRouteSnapshot): Observable<null | IParentOrganization> => {
  const id = route.params.id;
  if (id) {
    return inject(ParentOrganizationService)
      .find(id)
      .pipe(
        mergeMap((parentOrganization: HttpResponse<IParentOrganization>) => {
          if (parentOrganization.body) {
            return of(parentOrganization.body);
          }
          inject(Router).navigate(['404']);
          return EMPTY;
        }),
      );
  }
  return of(null);
};

export default parentOrganizationResolve;
