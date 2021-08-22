import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { Product } from '../../product/product.model';
import { ProductService } from '../../product/product.service';
import { Stock } from '../stock.model';
import { StockService } from '../stock.service';

@Component({
  selector: 'app-stock',
  templateUrl: './stock.component.html',
  styleUrls: ['./stock.component.css']
})
export class StockComponent implements OnInit {
 
  
  constructor(
    
    private productService: ProductService, 
    private stockService: StockService, 
    private router: Router) { }

  ngOnInit(): void {
  }

  

  

}
