import { Request, Response } from "express"
import { PostBusiness } from "../business/PostBusiness"
import { CreatePostInput } from "../dtos/postDTO"

export class PostController {
    constructor(private postBusiness: PostBusiness){}

    public getPosts = async (req: Request, res: Response) => {
        try {
          const q = req.query.q as string | undefined
          const output = await this.postBusiness.getPosts(q) 

          res.status(200).send(output)
        
        } catch (error) {
            console.log(error)

            if (error instanceof Error) {
              res.status(500).send(error.message)
            } else {
              res.status(500).send("Erro inesperado")
            }            
        }
    }

    public createPost = async (req: Request, res: Response) => {
      try {

        const input: CreatePostInput = {
          content: req.body.content,
          token: req.headers.authorization
        }

        const output = await this.postBusiness.createPost(input)

        res.status(201).send(output)
        
      } catch (error) {
        console.log(error)

            if (error instanceof Error) {
              res.status(500).send(error.message)
            } else {
              res.status(500).send("Erro inesperado")
            }
        
      }
    }
}