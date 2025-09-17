import React from 'react'
import { useForm } from 'react-hook-form'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { toast } from 'react-hot-toast';
import { apiUrl, token } from '../../common/Config';

const UpdateChapter = ({showChapter,handleClose,chapterData,setChapters}) => {


    const [loading,setLoading]=React.useState(false)
    const {
        register,
        handleSubmit,
        formState:{errors},
        setError,
        reset
    }=useForm()

    const onSubmit=async(data)=>{
        await fetch(`${apiUrl}/chapters/${chapterData.id}`,{
            method:"PUT",
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
                'Authorization':`Bearer ${token}`
            },
            body:JSON.stringify(data)
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                toast.success(result.message)
                setChapters({type:"UPDATE_CHAPTER",payload:result.data})
                handleClose(true)
            }
        })

    }

    React.useEffect(()=>{

        if(chapterData){
            reset({
                chapter:chapterData.title
            })
        }

    },[chapterData])

    return (
        <>
            <Modal size='lg' show={showChapter} onHide={handleClose}>
                <form onSubmit={handleSubmit(onSubmit)}>
                    <Modal.Header closeButton>
                        <Modal.Title>Update Chapter</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div className='mb-3'>
                            <label htmlFor="chapter" className='form-label'>Chapter</label>
                            <input
                                {
                                ...register('chapter', {
                                    required: 'the chapter field is required'
                                })
                                }
                                type="text"
                                placeholder='Chapter'
                                className={`form-control ${errors.chapter && 'is-invalid'}`}
                            />
                            {
                                errors.chapter && <p className='invalid-feedback'>{errors.chapter.message}</p>
                            }
                        </div>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button disabled={loading} type='submit' className='btn btn-primary' variant="primary">
                            {loading ? 'Updating...' : 'Update'}
                        </Button>
                    </Modal.Footer>
                </form>
            </Modal>
        </>
    )
}

export default UpdateChapter