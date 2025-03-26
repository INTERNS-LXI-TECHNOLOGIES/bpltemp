import { ComponentFixture, TestBed } from '@angular/core/testing';
import { provideRouter, withComponentInputBinding } from '@angular/router';
import { RouterTestingHarness } from '@angular/router/testing';
import { of } from 'rxjs';

import { WayBillDetailComponent } from './way-bill-detail.component';

describe('WayBill Management Detail Component', () => {
  let comp: WayBillDetailComponent;
  let fixture: ComponentFixture<WayBillDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [WayBillDetailComponent],
      providers: [
        provideRouter(
          [
            {
              path: '**',
              loadComponent: () => import('./way-bill-detail.component').then(m => m.WayBillDetailComponent),
              resolve: { wayBill: () => of({ id: 27026 }) },
            },
          ],
          withComponentInputBinding(),
        ),
      ],
    })
      .overrideTemplate(WayBillDetailComponent, '')
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(WayBillDetailComponent);
    comp = fixture.componentInstance;
  });

  describe('OnInit', () => {
    it('Should load wayBill on init', async () => {
      const harness = await RouterTestingHarness.create();
      const instance = await harness.navigateByUrl('/', WayBillDetailComponent);

      // THEN
      expect(instance.wayBill()).toEqual(expect.objectContaining({ id: 27026 }));
    });
  });

  describe('PreviousState', () => {
    it('Should navigate to previous state', () => {
      jest.spyOn(window.history, 'back');
      comp.previousState();
      expect(window.history.back).toHaveBeenCalled();
    });
  });
});
