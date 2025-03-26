import { Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'authority',
    data: { pageTitle: 'bplshipmentmethodApp.adminAuthority.home.title' },
    loadChildren: () => import('./admin/authority/authority.routes'),
  },
  {
    path: 'facility-type',
    data: { pageTitle: 'bplshipmentmethodApp.facilityType.home.title' },
    loadChildren: () => import('./facility-type/facility-type.routes'),
  },
  {
    path: 'shipment-method',
    data: { pageTitle: 'bplshipmentmethodApp.shipmentMethod.home.title' },
    loadChildren: () => import('./shipment-method/shipment-method.routes'),
  },
  /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
];

export default routes;
