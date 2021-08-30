import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
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

  product: Product = {} as Product;
  stock: Stock = {} as Stock;
    
  constructor(  
    private route: ActivatedRoute,
    private productService: ProductService,
    private stockService: StockService, 
    private router: Router) { }

  ngOnInit(): void {

 
    
  }

  

  

  

  

}
