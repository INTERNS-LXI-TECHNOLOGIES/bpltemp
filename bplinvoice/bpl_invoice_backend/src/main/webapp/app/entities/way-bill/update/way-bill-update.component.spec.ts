import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { ICurrencyType } from 'app/entities/currency-type/currency-type.model';
import { CurrencyTypeService } from 'app/entities/currency-type/service/currency-type.service';
import { WayBillService } from '../service/way-bill.service';
import { IWayBill } from '../way-bill.model';
import { WayBillFormService } from './way-bill-form.service';

import { WayBillUpdateComponent } from './way-bill-update.component';

describe('WayBill Management Update Component', () => {
  let comp: WayBillUpdateComponent;
  let fixture: ComponentFixture<WayBillUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let wayBillFormService: WayBillFormService;
  let wayBillService: WayBillService;
  let currencyTypeService: CurrencyTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [WayBillUpdateComponent],
      providers: [
        provideHttpClient(),
        FormBuilder,
        {
          provide: ActivatedRoute,
          useValue: {
            params: from([{}]),
          },
        },
      ],
    })
      .overrideTemplate(WayBillUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(WayBillUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    wayBillFormService = TestBed.inject(WayBillFormService);
    wayBillService = TestBed.inject(WayBillService);
    currencyTypeService = TestBed.inject(CurrencyTypeService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should call currencyType query and add missing value', () => {
      const wayBill: IWayBill = { id: 6454 };
      const currencyType: ICurrencyType = { id: 3445 };
      wayBill.currencyType = currencyType;

      const currencyTypeCollection: ICurrencyType[] = [{ id: 3445 }];
      jest.spyOn(currencyTypeService, 'query').mockReturnValue(of(new HttpResponse({ body: currencyTypeCollection })));
      const expectedCollection: ICurrencyType[] = [currencyType, ...currencyTypeCollection];
      jest.spyOn(currencyTypeService, 'addCurrencyTypeToCollectionIfMissing').mockReturnValue(expectedCollection);

      activatedRoute.data = of({ wayBill });
      comp.ngOnInit();

      expect(currencyTypeService.query).toHaveBeenCalled();
      expect(currencyTypeService.addCurrencyTypeToCollectionIfMissing).toHaveBeenCalledWith(currencyTypeCollection, currencyType);
      expect(comp.currencyTypesCollection).toEqual(expectedCollection);
    });

    it('Should update editForm', () => {
      const wayBill: IWayBill = { id: 6454 };
      const currencyType: ICurrencyType = { id: 3445 };
      wayBill.currencyType = currencyType;

      activatedRoute.data = of({ wayBill });
      comp.ngOnInit();

      expect(comp.currencyTypesCollection).toContainEqual(currencyType);
      expect(comp.wayBill).toEqual(wayBill);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IWayBill>>();
      const wayBill = { id: 27026 };
      jest.spyOn(wayBillFormService, 'getWayBill').mockReturnValue(wayBill);
      jest.spyOn(wayBillService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ wayBill });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: wayBill }));
      saveSubject.complete();

      // THEN
      expect(wayBillFormService.getWayBill).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(wayBillService.update).toHaveBeenCalledWith(expect.objectContaining(wayBill));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IWayBill>>();
      const wayBill = { id: 27026 };
      jest.spyOn(wayBillFormService, 'getWayBill').mockReturnValue({ id: null });
      jest.spyOn(wayBillService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ wayBill: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: wayBill }));
      saveSubject.complete();

      // THEN
      expect(wayBillFormService.getWayBill).toHaveBeenCalled();
      expect(wayBillService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IWayBill>>();
      const wayBill = { id: 27026 };
      jest.spyOn(wayBillService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ wayBill });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(wayBillService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });

  describe('Compare relationships', () => {
    describe('compareCurrencyType', () => {
      it('Should forward to currencyTypeService', () => {
        const entity = { id: 3445 };
        const entity2 = { id: 18260 };
        jest.spyOn(currencyTypeService, 'compareCurrencyType');
        comp.compareCurrencyType(entity, entity2);
        expect(currencyTypeService.compareCurrencyType).toHaveBeenCalledWith(entity, entity2);
      });
    });
  });
});
