import { Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'authority',
    data: { pageTitle: 'invoicebackendApp.adminAuthority.home.title' },
    loadChildren: () => import('./admin/authority/authority.routes'),
  },
  {
    path: 'way-bill',
    data: { pageTitle: 'invoicebackendApp.wayBill.home.title' },
    loadChildren: () => import('./way-bill/way-bill.routes'),
  },
  {
    path: 'currency-type',
    data: { pageTitle: 'invoicebackendApp.currencyType.home.title' },
    loadChildren: () => import('./currency-type/currency-type.routes'),
  },
  /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
];

export default routes;
