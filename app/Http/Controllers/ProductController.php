<?php

namespace GFP\Http\Controllers;

use GFP\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all()->toArray();
        return array_reverse($products);
    }

    public function store(Request $request)
    {
        $product = new Product([
            'name' => $request->input('name'),
            'detail' => $request->input('detail')
        ]);
        $product->save();

        return response()->json('Product created!');
    }

    public function show($id)
    {
        $product = Product::find($id);
        return response()->json($product);
    }

    public function destroy($id)
    {
        $product = Product::find($id);
        $product->delete();

        return response()->json('Product deleted!');
    }
}
