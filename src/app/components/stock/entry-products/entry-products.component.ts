import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Stock } from '../stock.model';
import { StockService } from '../stock.service';


@Component({
  selector: 'app-entry-products',
  templateUrl: './entry-products.component.html',
  styleUrls: ['./entry-products.component.css']
})
export class EntryProductsComponent implements OnInit {

  stock: Stock = {} as Stock;

  constructor(
    private stockService: StockService, 
    private router: Router,
    private route: ActivatedRoute) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    this.stockService.readById(id).subscribe(stock => {
        this.stock = stock;
        console.log("peça: ", stock);
    });
  }

  createStock(): void {
    this.stockService.create(this.stock).subscribe(() => {
      this.stockService.showMessage('Entrada efetuada com sucesso !!!')
      this.router.navigate(['products/read2'])
    });
  }

  cancel(): void {
    this.router.navigate(['/products/read2'])
  }

}