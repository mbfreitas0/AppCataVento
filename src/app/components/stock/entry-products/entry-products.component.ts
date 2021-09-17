import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Stock } from '../stock.model';
import { StockService } from '../stock.service';
import { ProductService } from '../../product/product.service';
import { Product } from '../../product/product.model';

@Component({
  selector: 'app-entry-products',
  templateUrl: './entry-products.component.html',
  styleUrls: ['./entry-products.component.css']
})
export class EntryProductsComponent implements OnInit {

  stock: Stock = {} as Stock;
  product: Product = {} as Product;

  constructor(
    private stockService: StockService,
    private productService: ProductService, 
    private router: Router,
    private route: ActivatedRoute) { }

  ngOnInit(): void {
    const id_product = this.route.snapshot.paramMap.get('id');
    this.stockService.readById(id_product).subscribe(stock => {
        this.stock = stock;
        console.log("peça: ", stock);
    });
    const id = this.route.snapshot.paramMap.get('id');
    this.productService.readById(id).subscribe(product => {
        this.product = product;
        console.log("produto: ", product);
    });
  }

  createStock(): void {
    this.stockService.update(this.stock).subscribe(() => {
      this.stockService.showMessage('Entrada efetuada com sucesso !!!')
      this.router.navigate(['products/read2'])
    });
  }

  cancel(): void {
    this.router.navigate(['/products/read2'])
  }

}