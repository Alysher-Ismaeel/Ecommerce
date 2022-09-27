<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
      //  return parent::toArray($request);
        return [
            'id'=> $this->id,
            'image'=> $this->image,
            'price'=> $this->price,
            'name'=> $this->name,
            'quantity'=> $this->quantity,
         //   'owner_id'=> $this->owner_id,
            'category_id'=> $this->category_id,
            'updated_at'=>$this->updated_at->format(d/m/y),
            'created_at'=>$this->created_at->format(d/m/y),

        ];
    }
}
