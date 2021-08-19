import { Product } from './../product.model';
import { ProductService } from './../product.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-product-read',
  templateUrl: './product-read.component.html',
  styleUrls: ['./product-read.component.css']
})
export class ProductReadComponent implements OnInit {

  products: Product[];
  
  displayedColumns = ['id', 'descricao', 'status', 'estoque_min', 'estoque_max', 'action']
  constructor(private productService: ProductService) { }

  ngOnInit(): void {
       
   
    this.productService.read().subscribe(products => {
      
      this.products = products['produtos'];
      console.log(products)
      
    })
  }

}
