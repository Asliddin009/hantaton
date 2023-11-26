import 'package:flutter/material.dart';
import 'package:hantaton_app/feature/home/domain/entity/event/event_entity.dart';
import 'package:hantaton_app/feature/home/ui/components/event_bottom_sheet.dart';
class ContainerTile extends StatelessWidget {
   ContainerTile({super.key,required  this.entity,required this.onTap});

  EventEntity entity;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background_tile.png')),
          borderRadius:
          BorderRadius.all(Radius.circular(15)),
        ),
        width: 300,
        height: 100,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Opacity(
              opacity:0.7,
              child: Container(
                height: 100,
                width: 280,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius:
                  BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        entity.name??" ",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entity?.price==null?"Бесплатно":entity?.price.toString()??" ",
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            entity.dateStart==null?"27 декабря":entity.dateStart.toString()??" ",
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                  ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
